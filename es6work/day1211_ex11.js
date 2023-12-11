const array=[1,2,3,4,5];  //3을 제거하고 싶다
//const delIndex=2;

//splice
// array.splice(삭제할 인덱스 번호,갯수);
array.splice(2,1); //삭제할 인덱스,1개만 삭제
console.log(array);

//slice
//slice는 원본 배열은 건드리지 않고 수정된 복사 배열을 return한다(교체는 안됨)
var array2=[1,2,3,4,5]; //3,4를 출력
var a2=array2.slice(2,4); //시작 인덱스, 지정한 인덱스-1까지만 뽑아줌... index 2~index 3만 뽑아줌
console.log(a2);

var a3=array2.slice(1,4); //index 1~index 3만 뽑아줌
console.log(a3);


//Arrays.concat(value);
//concat메서드는 원하는 값을 원본 배열끝에 추가한 뒤 새로운 배열을 만든다
let con=[1,2,3].concat([4,5],[6,7]); //배열 추가 후 또 추가할 수도 있다
console.log(con);


//filter
var arr=[1,2,3,4,5]; //2를 제거하고 싶다
var delInx=1; //2의 index 값

arr=arr.filter(function(item,index){ //filter 안에 인자로 함수를 받고, index만 필요하니까 명시

    return index !== delInx; // 배열을 돌면서 index 1이 아닌 나머지만 다시 소집한다 //delInx가 아닌 값만 return 받음
})

console.log(arr);