import { getConnection, sql } from "../database/connection.js";

export const getBodega = async (req, res) => {

  const pool = await getConnection();
  const result = await pool
    .request()
    .execute('pa_GetBodegas')

  res.json(result.recordset);
  pool.close();


}
export const agregarBodega = async (req, res) => {

  const pool = await getConnection();

  const result = await pool
    .request()
    .input('pNombreBodega', req.body.pNombreBodega)
    .input('pUbicacion', req.body.pUbicacion)

    .execute('pa_AgregarBodega');

  const resultMessage = result.recordset[0].Msg;
  res.json({ message: resultMessage });
  pool.close();

};

export const eliminarBodega = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
      .request()
      .input('pIdBodega', req.params.pIdBodega)
      .execute('pa_EliminarBodega');

  const resultMessage = result.recordset[0].Msg;
  res.json({ message: resultMessage });
  pool.close();
};

export const actualizarBodega = async (req, res) => {

  const { pIdBodega } = req.params;
  const pool = await getConnection();
  const { pNombreBodega, pUbicacion } = req.body;

  const result = await pool
    .request()
    .input('pIdBodega', pIdBodega)
    .input('pNombreBodega', pNombreBodega)
    .input('pUbicacion', pUbicacion)
    .execute('pa_ActualizarBodega')

  const resultMessage = result.recordset[0].Msg;
  res.json({ message: resultMessage });



};
