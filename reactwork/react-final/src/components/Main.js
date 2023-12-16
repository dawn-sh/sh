import React from 'react';
import img1 from '../image/71.jpeg';
import img2 from '../image/61.jpeg';
import img3 from '../image/download.jpeg';
import img4 from '../image/hq720.jpg';
import img5 from '../image/images.jpeg';
import img6 from '../image/99.jpeg';

function Main(props) {
    return (
        <div>
            <img src={img3}/>
            <img src={img4}/>
            <img src={img5}/>
            <img src={img1}/>
            <img src={img6}/>
            <img src={img2} style={{width:'300px'}}/>
        </div>
    );
}

export default Main;