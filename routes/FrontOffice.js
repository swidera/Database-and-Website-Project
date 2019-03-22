module.exports = function() {
	var express = require('express');
	var router = express.Router();

	//Get access to Team table for the drop down menus
	 function getTeam(res, mysql, context, complete){
		var sql = "SELECT Abbreviation FROM `Team`";
        	mysql.pool.query(sql, function(error, results, fields){
            		if(error){
                		res.write(JSON.stringify(error));
                		res.end();
           		}
           		context.Team  = results;
            		complete();
        	});
    	}
	
	/* FrontOffice Home Page*/
	
	//Displays all FrontOfficees
	function getFrontOffice(res, mysql, context, complete) {
		var sql = "SELECT ID_Front_Office AS fid, First_Name, Last_Name, Role, Team FROM `Front_Office`";
		mysql.pool.query(sql, function(error, results, fields) {
			if(error) {
				res.write(JSON.stringify(error));
				res.end();
			}
			context.FrontOffice = results;
			complete();
		});
	};
	
	//Displays Selected FrontOffice
	function getFrontOfficeUpdate(req, res, mysql, context, complete) {
		var sql = "SELECT First_Name, Last_Name, Role, Team FROM `Front_Office` WHERE ID_Front_Office = ?";
		console.log(req.params)
		var inserts = [req.params.fid];
		mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				res.write(JSON.stringify(error));
				res.end();
			}
			context.FrontOffice = results;
			complete();
		});
	};
	
	//Display all FrontOfficees
	router.get('/', function(req, res) {
		var callbackCount = 0;
		const context = {};
		context.title = "FrontOffice";
		context.jsscripts = ["deleteFrontOffice.js"];
		var mysql = req.app.get('mysql');
		getTeam(res, mysql, context, complete);		
		getFrontOffice(res, mysql, context, complete);
		function complete() {
			callbackCount++;
			if(callbackCount >= 2) {
				console.log(context.FrontOffice);
				res.render('FrontOffice', context);
			}
		}
	});
				
	//Create a new FrontOffice
	router.post('/', function(req, res) {
		var mysql = req.app.get('mysql');
		var sql = "INSERT INTO `Front_Office` (First_Name, Last_Name, Role, Team) VALUES (?, ?, ?, ?)";
		var inserts = [req.body.First_Name, req.body.Last_Name, req.body.Role, req.body.Team];
		sql = mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				return res.status(400).send(JSON.stringify(error));
			}
			else {
				res.redirect('/FrontOffice');
			}
		});
	});

	//Delete a FrontOffice
	router.delete('/:fid', function(req, res) {
		var mysql = req.app.get('mysql');
		var sql = "DELETE FROM `Front_Office` WHERE ID_Front_Office = ?";
		var inserts = [req.params.fid];
		sql = mysql.pool.query(sql, inserts, function(err, results, fields) {
			if(err) {
				return res.status(400).send(JSON.stringify(err));
			} else {
				res.status(202).end();
			}
		});
	});
	
	/* Update FrontOffice Page*/
	
	//Display to Update FrontOffice
	router.get('/UpdateFrontOffice/', function(req, res) {
		var callbackCount = 0;
		const context = {};
		context.title = "UpdateFrontOffice";
		context.jsscripts = [];
		console.log(req.params.fid)
		var mysql = req.app.get('mysql');
		getTeam(res, mysql, context, complete);	
		//getFrontOfficeUpdate(req, res, mysql, context, complete);
		function complete() {
			callbackCount++;
			if(callbackCount >= 1) {
				//console.log(context);
				res.render('UpdateFrontOffice', context);
			}
		}
	});
	
	//Update FrontOffice
	router.post('/UpdateFrontOffice/', function(req, res) {
		var mysql = req.app.get('mysql');
		console.log(req.body)
		console.log(req.params)
		var sql = "UPDATE `Front_Office` SET First_Name = ?, Last_Name = ?, Role = ?, Team = ? WHERE ID_Front_Office = ?";
		var inserts = [req.body.New_First_Name, req.body.New_Last_Name, req.body.New_Role, req.body.New_Team, req.body.ID_Update];
		sql = mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				console.log("There was an error in posting")
				res.write(JSON.stringify(error));
				res.end();
			} else {
				res.redirect('/FrontOffice');
			}
		});
	});

	return router;
}();
