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
	
	/* Player Home Page*/
	
	//Displays all Players
	function getPlayer(res, mysql, context, complete) {
		var sql = "SELECT ID_Player AS pid, First_Name, Last_Name, College, Number, Team FROM `Player`";
		mysql.pool.query(sql, function(error, results, fields) {
			if(error) {
				res.write(JSON.stringify(error));
				res.end();
			}
			context.Player = results;
			complete();
		});
	};
	
	
	//Display all Players
	router.get('/', function(req, res) {
		var callbackCount = 0;
		const context = {};
		context.title = "Player";
		context.jsscripts = ["deletePlayer.js", "filterPlayer.js"];
		var mysql = req.app.get('mysql');
		getTeam(res, mysql, context, complete);		
		getPlayer(res, mysql, context, complete);
		function complete() {
			callbackCount++;
			if(callbackCount >= 2) {
				console.log(context.Player);
				res.render('Player', context);
			}
		}
	});
	
      function getPlayerbyTeam(req, res, mysql, context, complete){
      var query = "SELECT ID_Player AS pid, First_Name, Last_Name, College, Number, Team FROM `Player` WHERE Team = ?";
      console.log(req.params)
      var inserts = [req.params.Team]
      mysql.pool.query(query, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.Player = results;
            complete();
        });
    }
	
	/*Display all people from a given homeworld. Requires web based javascript to delete users with AJAX*/
    router.get('/filter/:Team', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deletePlayer.js","filterPlayer.js"];
        var mysql = req.app.get('mysql');
        getPlayerbyTeam(req, res, mysql, context, complete);
        getTeam(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('Player', context);
            }

        }
    });
	
	//Create a new Player
	router.post('/', function(req, res) {
		var mysql = req.app.get('mysql');
		var sql = "INSERT INTO `Player` (First_Name, Last_Name, College, Number, Team) VALUES (?, ?, ?, ?, ?)";
		var inserts = [req.body.First_Name, req.body.Last_Name, req.body.College, req.body.Number, req.body.Team];
		sql = mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				return res.status(400).send(JSON.stringify(error));
			}
			else {
				res.redirect('/Player');
			}
		});
	});

	//Delete a Player
	router.delete('/:pid', function(req, res) {
		var mysql = req.app.get('mysql');
		var sql = "DELETE FROM `Player` WHERE ID_Player = ?";
		var inserts = [req.params.pid];
		sql = mysql.pool.query(sql, inserts, function(err, results, fields) {
			if(err) {
				return res.status(400).send(JSON.stringify(err));
			} else {
				res.status(202).end();
			}
		});
	});
	
	/* Update Player Page*/
	
	//Display to Update Player
	router.get('/UpdatePlayer/', function(req, res) {
		var callbackCount = 0;
		const context = {};
		context.title = "UpdatePlayer";
		context.jsscripts = [];
		console.log(req.params.pid)
		var mysql = req.app.get('mysql');
		getTeam(res, mysql, context, complete);	
		//getPlayerUpdate(req, res, mysql, context, complete);
		function complete() {
			callbackCount++;
			if(callbackCount >= 1) {
				//console.log(context);
				res.render('UpdatePlayer', context);
			}
		}
	});
	
	//Update Player
	router.post('/UpdatePlayer/', function(req, res) {
		var mysql = req.app.get('mysql');
		console.log(req.body)
		console.log(req.params)
		var sql = "UPDATE `Player` SET First_Name = ?, Last_Name = ?, College = ?, Number = ?, Team = ? WHERE ID_Player = ?";
		var inserts = [req.body.New_First_Name, req.body.New_Last_Name, req.body.New_College, req.body.New_Number, req.body.New_Team, req.body.ID_Update];
		sql = mysql.pool.query(sql, inserts, function(error, results, fields) {
			if(error) {
				console.log("There was an error in posting")
				res.write(JSON.stringify(error));
				res.end();
			} else {
				res.redirect('/Player');
			}
		});
	});
	

	return router;
}();
