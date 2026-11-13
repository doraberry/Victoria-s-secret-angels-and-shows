require("dotenv").config();
const express = require("express");
const path = require("path");
const pg = require("pg");
const Pool = pg.Pool;
const app = express();
const PORT = 3000;
const baza = new Pool();
app.use(express.static(path.join(__dirname, "public")));

app.get("/api/angels", async (req, res) => {
  try {
    const rez = await baza.query(`
      SELECT
        a.angel_id,
        a.firstname AS name,
        a.surname,
        TO_CHAR(a.date_of_birth, 'YYYY-MM-DD') AS date_of_birth,
        a.nationality,
        a.height_cm,
        a.active_from_year,
        a.active_to_year,
        a.status,
        a.hair_color,
        a.eye_color,
        a.agency,
        s.year AS show_year,
        s.city AS show_city,
        s.venue,
        p.performer_name,
        p.performer_fullname
      FROM public.angels AS a
      LEFT JOIN public.angelshows AS ast ON ast.angel_id = a.angel_id
      LEFT JOIN public.shows AS s ON s.show_id = ast.show_id
      LEFT JOIN public.showperformers AS sp ON sp.show_id = s.show_id
      LEFT JOIN public.performers AS p ON p.performer_id = sp.performer_id
    `);
    res.json(rez.rows);
  } catch (error) {
    console.error("Greška: ", error.message);
    res.status(500).json({
      error: "Podatci iz baze nisu dohvaćeni",
    });
  }
});
app.listen(PORT, () => {
  console.log(`http://localhost:${PORT}`);
});
