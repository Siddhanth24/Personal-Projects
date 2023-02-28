var mysql= require('mysql');
var faker= require('faker');
var connection=mysql.connection({
    host:'localhost',
    user:'root@localhost',
    database:'Giraffe'
    
})
var data=[];
for(var i=0;i<500;i++)
data.push[(
    faker.internet.email(),
    faker.date.past()
)]

console.log(data);
//var end_result=connection.query('Insert into set ?',person,function(error,result){
//if(error) throw error;
//console.log(result);
//});
//coneection.end();
