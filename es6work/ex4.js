function func1(x,y=200,z=300)
{
    console.log(x,y,z);
}
func1(3,4,5);
func1(100); //y,z는 이미 정의되어 있어서 x값만 들어가서 사용 된 거임
func1(3,4); //x,y값을 지정해주고 z는 인자에 300으로 정의해놔서 사용 됨
func1(); //x값만 undefined나고 뒤는 나옴

function func2(a,b) {
    return a+b;
}

console.log(func2(5,6));

let arr=[3,5,9];
let r2=func2(arr[0],arr[1]);

console.log(r2); //8

//... :es6에서 추가된 기능...펼침연산자
func1(...arr); //배열 안에 값들을 다 불러줌
func1(arr[0],arr[1],arr[2]); //...arr과 같음

let r3=func2(...arr); //함수인자 갯수와 배열갯수가 맞는 것 까지만 나옴
console.log(r3);