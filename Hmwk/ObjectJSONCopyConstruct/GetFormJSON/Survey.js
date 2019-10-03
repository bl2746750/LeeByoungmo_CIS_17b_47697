/*
 * Author:      Dr. Mark E. Lehr
 * Purpose:     Survey class
 */

//Constructor for the Survey
function Survey(name,description,quesNum){
    //How many arguments are provided
    var nArgs=arguments.length;//The number of arguments passed to the function
    if(nArgs==0||nArgs>3){//Empty Survey
        this.name="";
        this.desc="";
    }else if(nArgs==3){//Survey provided with all inputs
        this.name=name;
        this.desc=description;
        this.qstn=quesNum;
    }else if(nArgs==2){//Survey provided with no answers added latter
        this.name=name;
        this.desc=description;
    }else{
        this.name=name.name;
        this.desc=name.desc;
        this.qstn=name.qstn;
    }
};
//Setting the Category
Survey.prototype.setName=function(name){
    this.name=name;
};
//Setting the Survey
Survey.prototype.setDesc=function(description){
    this.desc=description;
};
//Adding an Answer
Survey.prototype.addQstn=function(question){
    this.qstn.push(question);
};
//Accessing the Category
Survey.prototype.getName=function(){
    return this.name;
};
//Accessing the Survey
Survey.prototype.getDesc=function(){
    return this.desc;
};
//Accessing one of the Answers
Survey.prototype.getQstn=function(number){
    if(number>=0&&number<this.quesNum.length){
        return this.quesNum[number];
    }else{
        return "This is not a Survey";
    }
};
//Displaying the Survey
Survey.prototype.display=function(){
    document.write("<p>"+"Name: "+this.name+"</p>");
    document.write("<br>"+"Description: "+this.desc+"<br><br>");
    for(var i=0;i<this.qstn.length;i++){
        if(this.qstn[i].length>0)
        document.write("Question"+(i+1)+": "+this.qstn[i]+"<br>");
    }
    document.write("<br>");
};