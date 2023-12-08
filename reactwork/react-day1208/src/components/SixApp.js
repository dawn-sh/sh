import React from 'react';
import Alert from '@mui/material/Alert';
import AdsClickIcon from '@mui/icons-material/AdsClick';

function OneApp(props) {
    return (
        <div>
            <h3 className='alert alert-info'>SixApp입니다</h3>
            <Alert severity="success">배열연습_#6<AdsClickIcon/></Alert>
        </div>
    );
}

export default OneApp;