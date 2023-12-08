import React from 'react';
import Alert from '@mui/material/Alert';
import AcUnitIcon from '@mui/icons-material/AcUnit';

function OneApp(props) {
    return (
        <div>
            <h3 className='alert alert-info'>FiveApp입니다</h3>
            <Alert severity="info">배열연습_#5<AcUnitIcon/></Alert>
        </div>
    );
}

export default OneApp;