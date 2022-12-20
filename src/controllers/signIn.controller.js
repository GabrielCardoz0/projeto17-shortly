import connection from "../database/db.js";
import { userSchema } from "../models/schemas.js";
import bcrypt from "bcrypt";
import {v4 as uuid} from "uuid";

export default async function signInCcontroller(req,res) {
    try{

        const {email, password } = req.body;


        const validate = userSchema.validate(req.body, { abortEarly:false});

        if(validate.error){
            const errorList = validate.error.details.map(d => d.message);
            return res.status(422).send(errorList);
        };

        const findUser = await connection.query("SELECT * FROM users WHERE email = $1", [email]);

        const passwordVerify = bcrypt.compareSync(password, findUser.rows[0].password);

        if(findUser.rows.length === 0 || !passwordVerify) return res.sendStatus(401);


        const token = uuid();

        await connection.query('INSERT INTO tokens (token,"userId") VALUES ($1,$2);',[token,findUser.rows[0].id]);

        res.status(200).send({token});

    }catch(err){
        console.log(err);
        return res.sendStatus(500);
    };
};


// try{}catch(err){
//     console.log(err);
//     return res.sendStatus(500);
// };