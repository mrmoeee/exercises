import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';


const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      let todosObj = {};
      action.todos.forEach( (todo) => {
        todosObj[todo.id] = todo;
      });
      return todosObj;
    case RECEIVE_TODO:
      const newTodo = {[action.todo.id]: action.todo};
      return Object.assign({}, state, newTodo); //will replace if key exists
    default:
      return state;
  }
};

export default todosReducer;
