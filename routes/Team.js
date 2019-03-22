module.exports = function() {
	var express = require('express');
	var router = express.Router();

	
	
	/* Team Home Page*/
	
	//Displays all Teams
	function getTeam(res, mysql, context, complete) {
		var sql = "SELECT Abbreviation AS tid, Name, City, State, Country, Stadium FROM `Team`";
		mysql.pool.query(sql, function(error, results, fields) {
			if(error) {
				res.write(JSON.stringify(error));
				res.end();
			}
			context.Team = results;
			complete();
		});
	};
	
	//Displays Selected Team
	function getTeamUpdate(req, res, mysql, context, complete) {
		var sql = "SELECT Name, City, State, Country, Stadium FROM `Team` WHERE Abbreviation = ?";
		console.log(req.params)
		var inserts = [req.params.tid];
		mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				res.write(JSON.stringify(error));
				res.end();
			}
			context.Team = results;
			complete();
		});
	};
	
	//Display all Teams
	router.get('/', function(req, res) {
		var callbackCount = 0;
		const context = {};
		context.title = "Team";
		context.jsscripts = ["deleteTeam.js"];
		var mysql = req.app.get('mysql');
		getTeam(res, mysql, context, complete);		
		function complete() {
			callbackCount++;
			if(callbackCount >= 1) {
				console.log(context.Team);
				res.render('Team', context);
			}
		}
	});
				
	//Create a new Team
	router.post('/', function(req, res) {
		var mysql = req.app.get('mysql');
		var sql = "INSERT INTO `Team` (Abbreviation, Name, City, State, Country, Stadium) VALUES (?, ?, ?, ?, ?, ?)";
		var inserts = [req.body.Abbreviation, req.body.Name, req.body.City, req.body.State, req.body.Country, req.body.Stadium];
		sql = mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				return res.status(400).send(JSON.stringify(error));
			}
			else {
				res.redirect('/Team');
			}
		});
	});

	//Delete a Team
	router.delete('/:tid', function(req, res) {
		var mysql = req.app.get('mysql');
		var sql = "DELETE FROM `Team` WHERE Abbreviation = ?";
		var inserts = [req.params.tid];
		sql = mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				return res.status(400).send(JSON.stringify(err));
			} else {
				res.status(202).end();
			}
		});
	});
	
	/* Update Team Page*/
	
	//Display to Update Team
	router.get('/UpdateTeam/', function(req, res) {
		var callbackCount = 0;
		const context = {};
		context.title = "UpdateTeam";
		context.jsscripts = [];
		console.log(req.params.tid)
		var mysql = req.app.get('mysql');
		getTeam(res, mysql, context, complete);	
		function complete() {
			callbackCount++;
			if(callbackCount >= 1) {
				//console.log(context);
				res.render('UpdateTeam', context);
			}
		}
	});
	
	//Update Team
	router.post('/UpdateTeam/', function(req, res) {
		var mysql = req.app.get('mysql');
		console.log(req.body)
		console.log(req.params)
		var sql = "UPDATE `Team` SET Name = ?, City = ?, State = ?, Country = ?, Stadium = ? WHERE Abbreviation = ?";
		var inserts = [req.body.New_Name, req.body.New_City, req.body.New_State, req.body.New_Country, req.body.New_Stadium, req.body.ID_Update];
		sql = mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				console.log("There was an error in posting")
				res.write(JSON.stringify(error));
				res.end();
			} else {
				res.redirect('/Team');
			}
		});
	});
		
	return router;
}();
