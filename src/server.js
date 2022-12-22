import express from "express";
import cors from "cors";
import router from "./routes/router.js";
import dotenv from "dotenv";

dotenv.config();

const app = express();
app.use(express.json());
app.use(cors());
app.use(router);

const port = process.env.PORT;

app.listen(port, () => console.log(`Server running in port: ${port}`));