import React from 'react';
import ReactDOM from 'react-dom';
import TodoListItem from './todo_list_item.jsx'
import {TodoForm} from './todo_form.jsx'

const TodoList = ({todos, receiveTodo}) => {
  return (
    <div>
      <TodoForm receiveTodo={receiveTodo}/>
      <ul>
        {/* typically don't use idx for key */}
        {todos.map((todo) => <TodoListItem todo={todo} key={todo.id}/>)}
      </ul>
    </div>
  );
};
export default TodoList;
