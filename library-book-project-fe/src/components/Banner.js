import React from 'react'
import { Button, Col } from 'react-bootstrap'

const Banner = () => {
  return (
    <Col style={{margin:'3rem'}}>
        
        <h1>Migliaia di libri in offerta</h1>
        <h2>Occasioni da non perdere assolutamente</h2>
        <Button>Approfittane ora</Button>
    </Col>
  )
}

export default Banner;