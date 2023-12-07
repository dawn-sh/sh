/*
var: 함수형 변수 / 재사용/업데이트/초기화 가능
let: 영역형 변수 / 변수 재선언 불가능
const: 영역형 변수 중 상수(final)
*/

//var Test:재선언가능, 업데이트 가능
var hello="안녕";
var hello="헬로우";
var cnt=5;

if(cnt<6){
    var hello1="say hello~~~";
    console.log(hello1);
}

console.log(hello1); //조건에 충족했을 때 값을 넣어줬기 때문에 조건 충족이 안되면 안됨
console.log(hello);

//let ..재선언 불가능, 업데이트 가능
let hi="hi";
hi="하이라고 할게";

let times=5;

if(times>3)
{ //이 영역을 벗어나면 let 변수는 사용 불가능
    let hi1="say Hi~~~";
    console.log(hi1);
}

//console.log(hi1);
console.log(hi);

//const : 업데이트 안되고, 재선언 안됨
const hi3={
    message:"3th say Hi~~",
    times:4
}

console.log(hi3);


//이렇게 업데이트는 안됨
// const hi3={
//     message:"4th say Hi~~",
//     times:5
// }

// console.log(hi3);

hi3.message="요렇게는 될까?";
hi3.times=44;

console.log(hi3);