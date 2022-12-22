import { nanoid } from "nanoid";
import connection from "../database/db.js";
import { urlSchema } from "../models/schemas.js";

export default async function urlShortenController(req,res) {
    try {
        const { url } = req.body;

        const validate = urlSchema.validate(req.body, { abortEarly:false});

        if(validate.error){
            const errorList = validate.error.details.map(d => d.message);
            return res.status(422).send(errorList);
        };

        const shortUrl = nanoid(8);

        const userId = res.locals.userId;

        await connection.query(`INSERT INTO urls (url,"shortUrl","userId",acesses) VALUES ($1,$2,$3,$4);` , [url,shortUrl,userId,0]);

        res.send({shortUrl});

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    };
};
