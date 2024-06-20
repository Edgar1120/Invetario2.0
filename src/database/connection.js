import sql from 'mssql'

const dbSettings = {
    user: 'EdgarAlvarez',
    password: 'edgar1120',
    server: 'localhost',
    database: 'ASADA',
    options: {
        encrypt: true,
        trustServerCertificate: true,
    }
}

export async function getConnection() {
    try {
        const pool = await sql.connect(dbSettings)
        return pool;
    } catch (error) {
        console.error(error);
    }
}

export { sql };