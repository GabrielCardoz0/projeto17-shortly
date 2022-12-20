import express, { query } from "express";
import cors from "cors";
import connection from "./database/db.js";
import router from "./routes/router.js";


const app = express();
app.use(express.json());
app.use(cors());
app.use(router);

app.get("/test" , async (req,res) => {
    const lista = await connection.query("SELECT * FROM users;");
    res.send(lista.rows)
});


app.listen(4000);