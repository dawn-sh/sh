//배열연습
//일반적인 출력
var numbers=[1,2,3,4,5];

//배열.map
var processd=numbers.map(function(num){
    return num*num;
});

console.log(processd); //1, 4, 9, 16, 25



var colors=['red','pink','gray','yellow','cyan']

//index값도 같이 뽑기
colors.map((color,index)=>{
    console.log(color,index);
})