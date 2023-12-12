import React from 'react';

function SixSubApp3(props) {
    return (
        <div>
            <h3>SixApp의 3번째 자식</h3>
            {/* 부모에서 만든 함수 넘긴것을 그대로 받아와서 사용 */}
            <button type='button' onClick={props.incre}>증가</button>
            <button type='button' onClick={props.decre}>감소</button>
        </div>
    );
}

export default SixSubApp3;