import connection from "../database/db.js";

export default async function openShortUrlController(req,res) {
    try {
        const { shortUrl } = req.params;


        const urlFinded = await connection.query('SELECT id, url,"shortUrl",acesses FROM urls WHERE "shortUrl" = $1;', [shortUrl]);

        if(urlFinded.rows.length === 0) return res.sendStatus(404);



        const acessQuantity = urlFinded.rows[0].acesses + 1;

        await connection.query('UPDATE urls SET acesses = $1 WHERE id = $2;', [acessQuantity,urlFinded.rows[0].id]);

        
        res.redirect(urlFinded.rows[0].url);

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }
};
