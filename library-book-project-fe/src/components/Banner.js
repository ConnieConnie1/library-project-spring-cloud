import React from 'react'
import { Button, Col } from 'react-bootstrap';
import axiosInstance from '../axiosConfig';

const Banner = () => {

  const handleButtonClick = () => {
    axiosInstance.get('/api/books/1')
      .then(response => {
  
        console.log('Risposta dal backend:', response.data);
      })
      .catch(error => {
      
        console.error('Errore durante la richiesta al backend:', error);
      });
  };
  return (
    <Col style={{margin:'3rem'}}>
        
        <h1>Migliaia di libri in offerta</h1>
        <h2>Occasioni da non perdere assolutamente</h2>
        <Button onClick={handleButtonClick}>Prova Connessione api</Button>
    </Col>
  )
}

export default Banner;