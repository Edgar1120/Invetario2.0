import { getConnection } from "../database/connection";

export const getInventario = async (req, res) => {

    const pool = await getConnection();
    const result = await pool
        .request()
        .execute('pa_GetInventario')

    res.json(result.recordset);
    pool.close();

}

export const agregarInventario = async (req, res) => {

    const pool = await getConnection();

    const result = await pool
        .request()
        .input('pIdArticulo', req.body.pIdArticulo)
        .input('pIdBodega', req.body.pIdBodega)
        .input('pUmbralMinimo', req.body.pUmbralMinimo)


        .execute('pa_AgregarInventario');

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });
    pool.close();

};

export const eliminarInventario = async (req, res) => {

    const pool = await getConnection();
    const result = await pool
        .request()
        .input('pIdInventario', req.params.pIdInventario)
        .execute('pa_EliminarInventario')

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });
    pool.close();

};

export const actualizarInventario = async (req, res) => {

    const { pIdInventario } = req.params;
    const pool = await getConnection();
    const { pIdArticulo, pIdBodega, pCantidadStock, pUmbralMinimo } = req.body;

    const result = await pool
        .request()
        .input('pIdInventario', pIdInventario)
        .input('pIdArticulo', pIdArticulo)
        .input('pIdBodega', pIdBodega)
        .input('pCantidadStock', pCantidadStock)
        .input('pUmbralMinimo', pUmbralMinimo)
        .execute('pa_ActualizarInventario')

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });



};
