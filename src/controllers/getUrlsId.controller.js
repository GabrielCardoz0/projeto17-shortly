import connection from "../database/db.js";


export default async function getUrlsIdController(req,res) {
    try {
        const { id } = req.params;

        const urlFinded = await connection.query('SELECT id, "shortUrl", url FROM urls WHERE id = $1;',[id]);

        if(urlFinded.rows.length === 0) return res.sendStatus(404);

        res.status(200).send(urlFinded.rows[0]);

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    };
};
