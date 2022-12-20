import connection from "../database/db.js";
import { newUserSchema } from "../models/schemas.js";
import bcrypt from "bcrypt";

export default async function signUpController(req,res) {
    try{
        const {name, email, password, confirmPassword} = req.body;

        const validate = newUserSchema.validate(req.body, { abortEarly:false});

        if(validate.error){
            const errorList = validate.error.details.map(d => d.message);
            return res.status(422).send(errorList);
        };

        if(password !== confirmPassword) return res.status(409).send("email já cadastrado ou senhas não coincidem");

        const dbVerify = await connection.query("SELECT * FROM users WHERE email = $1;" , [email]);

        if(dbVerify.rows.length > 0 ) return res.sendStatus(409);

        const encryptedPassword = bcrypt.hashSync(password, 10);

        await connection.query("INSERT INTO users (username, email, password) VALUES ($1,$2,$3)", [name, email, encryptedPassword]);

        res.sendStatus(201);

    }catch(err){
        console.log(err);
        return res.sendStatus(500);
    };
};

// try{}catch(err){
//     console.log(err);
//     return res.sendStatus(500);
// };