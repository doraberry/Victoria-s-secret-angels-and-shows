// HTML elementi
const table = document.getElementById("table");
const message = document.getElementById("poruka");
const forma = document.getElementById("forma");
const search = document.getElementById("search");
const atribut = document.getElementById("atribut");
const csvLink = document.getElementById("csv");
const jsonLink = document.getElementById("json");

const tijelo = table.createTBody(); // napravi <tbody> unutar prazne tablice
let sve = []; // svi retci iz baze
let stupci = []; // nazivi stupaca iz baze
let trazeniData = []; // filtirani retci

function postavi(link, sadrzaj, tip) {
  const stariUrl = link.getAttribute("href");
  if (stariUrl) {
    //ako postoji stari URL mičemo ga
    URL.revokeObjectURL(stariUrl);
  }
  const datoteka = new Blob([sadrzaj], { type: tip });
  link.href = URL.createObjectURL(datoteka);
}

function preuzimanja(data) {
  const json = JSON.stringify(data, null, 2); // stringify = u JSON, null ostavlja sva polja, 2 je broj razmaka za uvlake
  postavi(jsonLink, json, "application/json");
  const retci = [stupci.join(",")];
  for (const el of data) {
    const celije = [];
    for (const stupac of stupci) {
      const tekst = String(el[stupac] ?? "");
      const tekstZaCsv = tekst.replaceAll('"', '""');
      celije.push(`"${tekstZaCsv}"`);
    }
    retci.push(celije.join(","));
  }
  const csv = retci.join("\r\n");
  postavi(csvLink, csv, "text/csv;charset=utf-8");
}
function prikaz(data) {
  tijelo.textContent = "";
  for (const el of data) {
    const red = tijelo.insertRow();
    for (const stupac of stupci) {
      red.insertCell().textContent = el[stupac] ?? "";
    }
  }
  message.textContent = "Broj rezultata: " + data.length;
  preuzimanja(data);
}
async function ucitaj() {
  try {
    const response = await fetch("/api/angels");
    if (!response.ok) {
      throw new Error("Dohvaćanje podataka nije uspjelo");
    }
    sve = await response.json(); // iz JSON u JS objekt
    stupci = Object.keys(sve[0] ?? {});
    if (stupci.length > 0) {
      const zaglavlje = table.createTHead().insertRow();
      for (const stupac of stupci) {
        const th = document.createElement("th");
        th.textContent = stupac;
        zaglavlje.appendChild(th);
        atribut.add(new Option(stupac, stupac));
      }
    }
    trazeniData = sve;
    prikaz(trazeniData);
  } catch (error) {
    message.textContent = "Greška pri učitavanju podataka";
    console.error(error);
  }
}
forma.addEventListener("submit", (event) => {
  event.preventDefault();
  const trazeniTekst = search.value.trim().toLowerCase();
  let stupciZaPretragu;
  if (atribut.value === "all") {
    stupciZaPretragu = stupci;
  } else {
    stupciZaPretragu = [atribut.value];
  }
  trazeniData = [];
  for (const redak of sve) {
    for (const stupac of stupciZaPretragu) {
      const tekstCelije = String(redak[stupac] ?? "").toLowerCase();
      if (tekstCelije.includes(trazeniTekst)) {
        trazeniData.push(redak);
        break; //ako nademo jedan koji odgovara to je to
      }
    }
  }
  prikaz(trazeniData);
});
forma.addEventListener("reset", () => {
  trazeniData = sve;
  prikaz(trazeniData);
});
ucitaj();
