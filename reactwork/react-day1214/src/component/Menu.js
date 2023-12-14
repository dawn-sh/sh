import React from 'react';
import {NavLink} from 'react-router-dom';

function Menu(props) {
    return (
        <div>
            <ul className='menu'>
                {/* NavLink는 링크 걸어서 그 링크로 이동 가능하게 해주는 것 */}
                <li><NavLink to='/'>Home</NavLink></li>
                <li><NavLink to='/about'>About</NavLink></li>
                {/* <Route path='/about/:name' element={<About/>}/> RouterMain에서 해준 것을 여기서 다시 해준다 */}
                <li><NavLink to='/about/Choi'>About_Choi</NavLink></li>
                {/* 파라메터로 2개 값을 보내주기 위해서 to='/food/1/2'로 해줌
                    /1/2는 파일 이름 넣어주면 됨(음식 사진 이름이 1,2,3,4임) */}
                
                <li><NavLink to='/food/1/2'>점심 메뉴</NavLink></li>
                <li><NavLink to='/food/3/4'>저녁 메뉴</NavLink></li>
            </ul>
        </div>
    );
}

export default Menu;