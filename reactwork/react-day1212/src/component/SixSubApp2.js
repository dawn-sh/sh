import React from 'react';

//부모에서 넘긴 값을 인자값에 직접적으로 받을 수 있다
function SixSubApp2({flower,price,linecolor}) {
    return (
        <div>
            <h3 className='alert alert-secondary'>SixApp의 두번째 자식입니다</h3>
            <h3 className='line' style={{borderColor:linecolor}}>{flower}1묶음의 가격은 {price}입니다</h3>
        </div>
    );
}

export default SixSubApp2;