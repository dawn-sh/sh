//es6 에서는 class 기능이 추가됨

class Student{

    //생성자...무조건 클래스명이 constructor
    constructor(name){
        this.name=name;
    }

    //멤버함수
    /*showName(){
        console.log("내 이름은 "+this.name+"입니다");
    }*/

    //리터럴
    showName(){
        console.log(`내 이름은 ${this.name} 이랍니다!!!`);
    }
}

let s1=new Student("민규");
console.log("이름: "+s1.name);
s1.showName();

let s2=new Student("성경");
console.log(`이름: ${s2.name}`);
s2.showName();