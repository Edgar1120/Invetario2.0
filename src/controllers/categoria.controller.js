import { getConnection, sql } from "../database/connection.js";

export const getCategoria = async (req, res) => {

    const pool = await getConnection();
    const result = await pool
        .request()
        .execute('pa_GetCategorias')

    res.json(result.recordset);
    pool.close();

}

export const agregarCategoria = async (req, res) => {

    const pool = await getConnection();

    const result = await pool
        .request()
        .input('pNombreCategoria', req.body.pNombreCategoria)
        .input('pDescripcionCategoria', req.body.pDescripcionCategoria)
        .input('pNombreCorto', req.body.pNombreCorto)
        .input('pEstado', req.body.pEstado)
        .input('pDetallesAdicionales', req.body.pDetallesAdicionales)

        .execute('pa_AgregarCategoria');

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });
    pool.close();
};

export const eliminarCategoria = async (req, res) => {

    const pool = await getConnection();
    const result = await pool
        .request()
        .input('pIdCategoria', req.params.pIdCategoria)
        .execute('pa_EliminarCategoria')

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });
    pool.close();

};


export const actualizarCategoria = async (req, res) => {

    const { pIdCategoria } = req.params;
    const pool = await getConnection();
    const { pNombreCategoria, pDescripcionCategoria, pNombreCorto, pEstado,
        pDetallesAdicionales } = req.body;

    const result = await pool
        .request()
        .input('pIdCategoria', pIdCategoria)
        .input('pNombreCategoria', pNombreCategoria)
        .input('pDescripcionCategoria', pDescripcionCategoria)
        .input('pNombreCorto', pNombreCorto)
        .input('pEstado', pEstado)
        .input('pDetallesAdicionales', pDetallesAdicionales)
        .execute('pa_ActualizarCategoria')

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });


};
