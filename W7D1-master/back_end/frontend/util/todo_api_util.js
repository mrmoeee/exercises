import React from 'react';

export const fetchTodos = () => {
  return (
    $.ajax ({
      method: 'GET',
      url: '/api/todos'
    })
  );
};
