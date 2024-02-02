import React from "react";
import {
  Navbar,
  Container,
  ButtonGroup,
  Row,
  Col,
  Nav,
  Form,
  Button,
} from "react-bootstrap";
import "../App.css";

const MyNavbar = () => {
  return (
    <>
      <Navbar className="bg-body-tertiary d-flex justify-content-between px-5" data-bs-theme="light" >
        <Navbar.Brand href="#">📚</Navbar.Brand>
        <Form className="d-flex">
          <Form.Control
            type="search"
            placeholder="Cerca tra milioni di prodotti"
            className="me-2"
            aria-label="Search"
            style={{ minWidth: '250px' }} 
          />
          <Button variant="outline-info">Ricerca</Button>
        </Form>

        <Nav.Link href="#action1">❤️</Nav.Link>
        <Nav.Link href="#action2">🧺</Nav.Link>
      </Navbar>
      <Container>
        <Row className="mt-4">
          <ButtonGroup className="me-4" size="lg" aria-label="First group">
            <Button variant="outline-info">Libri</Button>{" "}
            <Button variant="outline-info">Libri outlet</Button>{" "}
            <Button variant="outline-info">Libri in inglese</Button>{" "}
            <Button variant="outline-info">Ebook</Button>{" "}
            <Button variant="outline-info">Film</Button>{" "}
            <Button variant="outline-info">Offerte</Button>
          </ButtonGroup>
        </Row>
      </Container>
    </>
  );
};

export default MyNavbar;
