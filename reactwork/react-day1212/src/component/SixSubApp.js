import React from 'react';

//자식은 부모에게 넘겨진 값을 읽기만 할 수 있다
function SixSubApp(props) {

    //부모에서 값 넘겨졌는지 확인
    console.dir(props);

    return (
        <div>
            {/* sub는 부모한테만 가면 된다 */}
            <h3 className='alert alert-info'>SixApp의 자식입니다</h3>
            {/* props로 넘겨진 값 가져오는 법 */}
            <div className='line'>{props.name}님의 나이는 {props.age}세 입니다</div>
        </div>
    );
}

export default SixSubApp;