//es6 좀 더 언어적으로 바뀜, Set,Map 가능(컬렉션)
let set=new Set("abcccdddeeefffff"); //중복문자 걸러줌
console.log(set);

set.add("g");//없으니까 추가됨
console.log(set);

console.log(set.has("a")); //has 있는지 없는지 반환하는데 있으면 true 없으면 false
console.log(set.has("z"));
console.log("길이: "+set.size);

console.log(...set);
set.delete("a"); // 하나씩 삭제/ a만 삭제
console.log(...set);

set.clear(); //전체삭제
console.log(set.size);


//비교연산자
let a=6;
let b="6";

console.log(a==b); //값으로만 비교해서 true 반환
console.log(a===b); //타입까지 비교해서 false 반환

