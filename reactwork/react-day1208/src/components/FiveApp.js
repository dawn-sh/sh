import React from 'react';
import Alert from '@mui/material/Alert';
import AcUnitIcon from '@mui/icons-material/AcUnit';
import img1 from '../image/1.jpeg';
import img2 from '../image/3.jpeg';
import img3 from '../image/4.jpeg';
import img4 from '../image/6.jpeg';
import img5 from '../image/10.jpeg';

function OneApp(props) {

    //이미지를 배열변수에 넣기(src)...public에 사진은 보통 안넣어놓고 src를 만들어서 사진 넣어두는게 보통
    const imageArr=[img1,img2,img3,img4,img5];


    //public에서 파일 이름만 넣어서 배열로 뽑아보기
    const imageArr2=['12','15','16','20','24'];



    return (
        <div>
            <h3 className='alert alert-info'>FiveApp입니다</h3>
            <Alert severity="info">배열연습_#5<AcUnitIcon/></Alert>
            {
                imageArr.map((myimg)=>(<img src={myimg} style={{width:'50px'}}/>))
            }

            <h4>public의 이미지를 배열로 넣어 반복하기</h4>
            {
                //예전방식
                imageArr2.map((photo)=>(<img src={'../image2/'+photo+'.jpeg'} className='photo'/>))
            }
            <br/>
            {
                //리터럴방식
                //리터럴방식에서 값 불러오고 싶으면 ${}을 사용하면 된다
                imageArr2.map((photo)=>(<img src={`../image2/${photo}.jpeg`} className='photo'/>))
            }

        </div>
    );
}

export default OneApp;