import { getConnection } from "../database/connection";

export const getMovimientoInventario = async (req, res) => {

    const pool = await getConnection();
    const result = await pool
        .request()
        .execute('pa_GetMovimientoInventario')

    res.json(result.recordset);
    pool.close();

}


export const agregarMovimientoInventario = async (req, res) => {
    try {
        const pool = await getConnection();
        const result = await pool
            .request()
            .input('pIdArticulo', req.body.pIdArticulo)
            .input('pIdBodegaOrigen', req.body.pIdBodegaOrigen)
            .input('pIdBodegaDestino', req.body.pIdBodegaDestino)
            .input('pCantidad', req.body.pCantidad)
            .input('pTipoMovimiento', req.body.pTipoMovimiento)
            .execute('pa_AgregarMovimientoInventario');

        const resultMessage = result.recordset[0].Msg;
        res.json({ message: resultMessage });
        pool.close();
    } catch (error) {
        res.status(500).json({ message: 'Error en el servidor', error: error.message });
    }
};
export const eliminarMovimientoInventario = async (req, res) => {
    try {
        const pool = await getConnection();
        const request = pool.request();
        request.input('pIdMovimiento', req.params.pIdMovimiento);
        const result = await request.execute('pa_EliminarMovimientoInventario');

        const resultMessage = result.recordset[0].Msg;
        res.json({ message: resultMessage });
        pool.close();
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error interno del servidor" });
    }
};
export const actualizarMovimientoInventario = async (req, res) => {

    const { pIdMovimiento } = req.params;
    const pool = await getConnection();
    const { pIdArticulo, pIdBodegaOrigen, pIdBodegaDestino,
        pCantidad, pTipoMovimiento,
        pFecha } = req.body;

    const result = await pool
        .request()
        .input('pIdMovimiento', pIdMovimiento)
        .input('pIdArticulo', pIdArticulo)
        .input('pIdBodegaOrigen', pIdBodegaOrigen)
        .input('pIdBodegaDestino', pIdBodegaDestino)
        .input('pCantidad', pCantidad)
        .input('pTipoMovimiento', pTipoMovimiento)
        .execute('pa_ActualizarMovimientoInventario')

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });



};
