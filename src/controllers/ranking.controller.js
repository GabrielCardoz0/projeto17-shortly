import connection from "../database/db.js";

export default async function rankingController(req,res) {
    try {
        const rankingList = await connection.query('SELECT users.id, users.username AS name, COUNT(urls."userId") AS "linksCount", SUM(urls.acesses) AS "visitCount"  FROM users JOIN urls ON users.id = urls."userId" GROUP BY users.id;');

        const arrOrdened = rankingList.rows.sort((a,b) => {
            return b.visitCount - a.visitCount;
        });


        res.send(arrOrdened);

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    };
};