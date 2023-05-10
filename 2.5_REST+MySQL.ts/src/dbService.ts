import mysql from 'mysql2';



const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "11111111",
    database: "klizma",
    port: 3306,
})



export default pool;
