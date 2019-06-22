const express = require('express');
const router = express.Router();

const pool = require('../database');


router.get('/add', (req, res) => {
 res.render('links/add');
})
router.post('/add', async (req, res) => {
    const { MatriculaAlumno, Nombre, Apaterno, Amaterno, licencia} = req.body;
    const newLink = {
        MatriculaAlumno, Nombre, Apaterno, Amaterno, licencia, MatriculaAlumno
    };
    await pool.query('INSERT INTO alumno set ?', [newLink]);
    req.flash('success', 'Registro agregado correctamente');
    res.redirect('/links');
    
});
router.get('/', async (req, res) => {
    const links = await pool.query('SELECT * FROM alumno')
    console.log(links);
    res.render('links/list',{ links });
});
router.get('/delete/:IdAlumno', async (req, res) => {
    const { IdAlumno } = req.params;
    await pool.query('DELETE FROM alumno WHERE MatriculaAlumno = ?', [IdAlumno]);
    req.flash('success', 'Registro borrado');
    res.redirect('/links');
});

router.get('/edit/:idAlumno', async (req, res) => {
    const { idAlumno } = req.params;
    const links = await pool.query('SELECT * FROM alumno WHERE MatriculaAlumno = ?', [idAlumno]);
    console.log(idAlumno);
    //res.send('recibido');
    res.render('links/edit', {link: links[0]});
});

router.post('/edit/:idAlumno', async (req, res) => {
    const { idAlumno } = req.params;
    const { MatriculaAlumno, Nombre, Apaterno, Amaterno, licencia} = req.body;
    const newLink = {
        MatriculaAlumno,
        Nombre,
        Apaterno,
        Amaterno,
        licencia};
    await pool.query('UPDATE alumno set ? WHERE MatriculaAlumno = ?', [newLink, idAlumno]);
    req.flash('success', 'Registro actualizado de manera exitosa');
    res.redirect('/links');
});



module.exports = router;