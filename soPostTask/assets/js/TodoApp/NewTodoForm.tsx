import React, { FormEvent, useState } from "react";
import { gql } from "apollo-boost";
import { useMutation } from "@apollo/react-hooks";
import { GET_TODO_ITEMS } from "./TodoList";

const CREATE_TODO_ITEM = gql`
  mutation createTodoItem($content: String!) {
    createTodoItem(content: $content) {
      id
      isCompleted
      content
    }
  }
`;

const NewTodoForm = () => {
  const [content, setContent] = useState("");
  const [createTodo] = useMutation(CREATE_TODO_ITEM, {
    update(cache, { data: { createTodoItem: newTodo } }) {
      const { todoItems } = cache.readQuery({ query: GET_TODO_ITEMS });
      cache.writeQuery({
        query: GET_TODO_ITEMS,
        data: {
          todoItems: [...todoItems, newTodo],
        },
      });
    },
  });

  const onSubmit = (e: FormEvent) => {
    e.preventDefault();
    if (content.trim() !== "") {
      createTodo({ variables: { content: content.trim() } });
      setContent("");
    }
  };
  return (
    <form className="todo_item new_todo_form" onSubmit={onSubmit}>
      <button className="todo_item__toggle"></button>
      <input
        type="text"
        className="todo_item__content"
        autoFocus
        value={content}
        onChange={(e) => setContent(e.target.value)}
      />
    </form>
  );
};

export default NewTodoForm;
