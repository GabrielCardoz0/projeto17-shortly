import connection from "../database/db.js";

export default async function bearerAuthenticationMiddleware(req,res,next) {
    try {
        const { authorization } = req.headers;

        const token = authorization?.replace("Bearer ", '').replace(/"/g,'');

        if(!token) return res.sendStatus(401);

        const tokenVerify = await connection.query(`SELECT * FROM tokens WHERE token =$1;`,[token]);

        if(tokenVerify.rows.length === 0 ) return res.sendStatus(401);

        res.locals.userId = tokenVerify.rows[0].userId;

        next();

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    };
};
