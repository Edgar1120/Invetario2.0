import { getConnection } from "../database/connection";

export const agregarUsuario = async (req, res) => {

    const pool = await getConnection();

    const result = await pool
        .request()
        .input('pNombre', req.body.pNombre)
        .input('pContrasena', req.body.pContrasena)
        .input('pRol', req.body.pRol)

        .execute('pa_AgregarUsuario');

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });
    pool.close();

};

export const actualizarUsuario = async (req, res) => {

    const { pIdUsuario } = req.params;
    const pool = await getConnection();
    const { pNombre, pContrasena, pRol } = req.body;

    const result = await pool
        .request()
        .input('pIdUsuario', pIdUsuario)
        .input('pNombre', pNombre)
        .input('pContrasena', pContrasena)
        .input('pRol', pRol)
        .execute('pa_ActualizarUsuario')

        const resultMessage = result.recordset[0].Msg;

        res.json({ message: resultMessage });
    

};

export const eliminarUsuario = async (req, res) => {

    const pool = await getConnection();
    const result = await pool
        .request()
        .input('pIdUsuario', req.params.pIdUsuario)
        .execute('pa_EliminarUsuario')

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });
    pool.close();

};

export const login = async (req, res) => {
    try {
        const pool = await getConnection();
        const result = await pool
            .request()
            .input('pNombre', req.body.pNombre)
            .input('pContrasena', req.body.pContrasena)
            .execute('pa_Login');

        if (result.recordsets.length > 0 && result.recordsets[0].length > 0) {
            const user = result.recordsets[0][0];
            res.status(200).json(user);
        } else {
            res.status(401).json({ message: 'Credenciales incorrectas' }); 
        }

        pool.close();
    } catch (error) {
        console.error('Error en la función login:', error);
        res.status(500).json({ message: 'Error interno del servidor' });
    }
};

export const getUsuario = async (req, res) => {

    const pool = await getConnection();
    const result = await pool
        .request()
        .execute('pa_GetUser')

    res.json(result.recordset);
    pool.close();


}


export const getAuditFecha = async (req, res) => {
    const pool = await getConnection();
    const result = await pool
        .request()
        .execute('pa_GetAuditoria')

    res.json(result.recordset);
    pool.close();
  }
