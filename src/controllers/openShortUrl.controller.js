import connection from "../database/db.js";

export default async function openShortUrlController(req,res) {
    try {
        const { shortUrl } = req.params;

        const urlFinded = await connection.query('SELECT url,"shortUrl",acesses FROM urls WHERE "shortUrl" = $1;', [shortUrl]);

        if(urlFinded.rows.length === 0) return res.sendStatus(404);
        
        // res.redirect(urlFinded.rows[0].url);

        res.send(urlFinded.rows);

        // fazer o update da contagem de acessos

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }
};
