import connection from "../database/db.js";

export default async function deleteUrlController(req,res) {
    try {
        
        const {id} = req.params;
        
        const urlFinded = await connection.query('SELECT * FROM urls WHERE id = $1;',[id]);

        if(urlFinded.rows.length === 0) return res.sendStatus(404);

        if(res.locals.userId !== urlFinded.rows[0].userId) return res.sendStatus(401);

        await connection.query('DELETE FROM urls WHERE id = $1;', [id]);

        res.sendStatus(204);

    } catch (error) {
        console.log(error);
        res.sendStatus(500); 
    };
};
