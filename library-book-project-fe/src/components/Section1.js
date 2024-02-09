import React from "react";
import { Col, Row } from "react-bootstrap";
import Button from "react-bootstrap/Button";
import Card from "react-bootstrap/Card";
import img from "../resources/img/book-cover.jpg"

const Section1 = () => {
  return (
    <div>
      <Row>
      <Col className="text-center" style={{marginBottom:'3rem'}}>
          <h3 >I titoli più amati</h3>
        </Col>
      </Row>
      <Row>
        <Card style={{ width: "16rem", marginLeft: "3rem" }}>
          <Card.Img variant="top" src={img} />
          <Card.Body>
            <Card.Title>Titolo del libro</Card.Title>
            <Card.Text>
              di nome autore
            </Card.Text>            
            <Card.Text>
              Editore, anno
            </Card.Text>
            <Button variant="primary">Guarda dettagli</Button>
          </Card.Body>
        </Card>
        <Card style={{ width: "16rem", marginLeft: "3rem" }}>
          <Card.Img variant="top" src={img} />
          <Card.Body>
            <Card.Title>Titolo del libro</Card.Title>
            <Card.Text>
              di nome autore
            </Card.Text>            
            <Card.Text>
              Editore, anno
            </Card.Text>
            <Button variant="primary">Guarda dettagli</Button>
          </Card.Body>
        </Card>
        <Card style={{ width: "16rem", marginLeft: "3rem" }}>
          <Card.Img variant="top" src={img} />
          <Card.Body>
            <Card.Title>Titolo del libro</Card.Title>
            <Card.Text>
              di nome autore
            </Card.Text>            
            <Card.Text>
              Editore, anno
            </Card.Text>
            <Button variant="primary">Guarda dettagli</Button>
          </Card.Body>
        </Card>
        
      </Row>
    </div>
  );
};

export default Section1;
