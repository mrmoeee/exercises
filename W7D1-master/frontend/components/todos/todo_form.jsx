import React from 'react';

function uniqueId() {
  return new Date().getTime();
}

//class bc we want to keep track of internal state
//usually whenever you have form or inputs (controlled input, where state of input isn't reliant on normal DOM, value=something React)
export class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(field) {
    return (e) => {
      e.preventDefault();
      this.setState({[field]: e.target.value}); //review
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const newTodo = {
      id: uniqueId(),
      title: this.state.title,
      body: this.state.body
    };
    this.props.receiveTodo(newTodo);
    this.setState({title: "", body: ""});
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Title:
          <input type="text" value={this.state.title} onChange={this.handleChange("title")}></input>
        </label>

        <label>
          Body:
          <input type="text" value={this.state.body} onChange={this.handleChange("body")}></input>
        </label>

        <button>Create Todo</button>
      </form>
    );
  }

  // /* <form onSubmit= {(e) => this.handleSubmit(e)}> */
  //<input type="text" value={this.state.title} onChange={(e) => this.handleChange("title", e)}></input>
}
