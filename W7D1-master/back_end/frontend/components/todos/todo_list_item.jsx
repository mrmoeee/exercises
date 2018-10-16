import React from 'react';


export const TodoListItem = ({todo}) => ( //destructuring todo out of props
  <li>{todo.title}</li>
);


export default TodoListItem;
