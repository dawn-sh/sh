import React from 'react';
import Alert from '@mui/material/Alert';
import AppleIcon from '@mui/icons-material/Apple';

function OneApp(props) {

    //배열변수선언
    const names=['영환','성경','호석','민규','성신','형준'];

    //반복문을 변수에 저장후 출력해도 된다
    //const nameList=배열명.map((변수)=>(결과값))
    const nameList=names.map((name)=>(<li>{name}</li>))

    //색상을 5개 배열로 주시고...결과물을 div로 출력하세요(box 로 className주고 할 것)
    const colors=['pink','cyan','black','gray','yellow'];
    const box={
        width:'100px',
        height:'100px',
        float:'left'
    }

    return (
        <div>
            {/* mui install 받아서 사용해보기
                터미널 프로젝트 있는 폴더들어가서 mui install 코드 가져와서 적용
                npm/yarn 상관 없는데 파일 달라할때 이 install한 파일 빼고 보내야함(용량이 너무 큼)
                style-components/icon 터미널에서 install 받기 */}
            <h3 className='alert alert-info'>FourApp입니다</h3>
            {/* mui alert 창 받아오기 번개모양 누르면 코드가 나옴/import도 꼭 받아야함
                icon은 import만 가져와서 <AppleIcon/> import 변수로 적어주면 바로 적용 가능 */}
            <Alert severity="error">배열연습 <AppleIcon/></Alert>
            <div>
                <h3>map연습</h3>
                {/* 배열주려면 {}안에 줘야한다 배열이름.map((변수,index은 줘도되고 안줘도 된다)=>(<b style={{marginLeft:'10px'}}>{index}:{변수}</b>)) */}
                <ol>
                    {
                        //반복문을 직접 리턴에 주기
                        names.map((name,index)=>(<b style={{marginLeft:'10px'}}>{index}:{name}</b>))
                    }
                </ol>

                <ol>{nameList}</ol>
                
                {colors.map((color)=>(<div style={{...box,backgroundColor:color}}></div>))}<br/>
                {colors.map((color)=>(<div className='box2' style={{backgroundColor:color}}></div>))}
            </div>
        </div>
    );
}

export default OneApp;