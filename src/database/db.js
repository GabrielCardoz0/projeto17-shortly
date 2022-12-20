import pkg from "pg";

const {Pool} = pkg;

const connection = new Pool({
    host:'localhost',
    port:5432,
    user:'gabriel',
    password:'gabriel',
    database:'dbprojeto_17'
});

export default connection;