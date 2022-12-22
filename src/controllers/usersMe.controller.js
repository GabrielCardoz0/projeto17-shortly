import connection from "../database/db.js";

export default async function usersMeController(req,res) {
    try {
        const urlsList = await connection.query('SELECT id, url, "shortUrl",acesses FROM urls WHERE "userId" = $1;' , [res.locals.userId]);

        const usersInfo = await connection.query('SELECT users.id, users.username AS name, SUM(urls.acesses) AS "visitCount" FROM users JOIN urls ON users.id = urls."userId" WHERE users.id = $1 GROUP BY users.id;',[res.locals.userId]);

        if(usersInfo.rows.length === 0) return res.sendStatus(404);

        const userInfoObject = {
            ...usersInfo.rows[0],
            shortenedUrls:urlsList.rows
        };

        res.status(200).send(userInfoObject);

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    };
};
