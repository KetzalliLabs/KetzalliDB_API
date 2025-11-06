import { Request, Response } from 'express';
import { Item, CreateItemDto, UpdateItemDto } from '../models/item.model';

// In-memory database (replace with real database in production)
let items: Item[] = [];

export const getAllItems = (req: Request, res: Response): void => {
  res.json({
    success: true,
    data: items,
    count: items.length
  });
};

export const getItemById = (req: Request, res: Response): void => {
  const { id } = req.params;
  const item = items.find(item => item.id === id);

  if (!item) {
    res.status(404).json({
      success: false,
      message: `Item with id ${id} not found`
    });
    return;
  }

  res.json({
    success: true,
    data: item
  });
};

export const createItem = (req: Request, res: Response): void => {
  const createItemDto: CreateItemDto = req.body;

  if (!createItemDto.name || !createItemDto.description) {
    res.status(400).json({
      success: false,
      message: 'Name and description are required'
    });
    return;
  }

  const newItem: Item = {
    id: Date.now().toString(),
    name: createItemDto.name,
    description: createItemDto.description,
    createdAt: new Date(),
    updatedAt: new Date()
  };

  items.push(newItem);

  res.status(201).json({
    success: true,
    data: newItem,
    message: 'Item created successfully'
  });
};

export const updateItem = (req: Request, res: Response): void => {
  const { id } = req.params;
  const updateItemDto: UpdateItemDto = req.body;

  const itemIndex = items.findIndex(item => item.id === id);

  if (itemIndex === -1) {
    res.status(404).json({
      success: false,
      message: `Item with id ${id} not found`
    });
    return;
  }

  const updatedItem: Item = {
    ...items[itemIndex],
    ...updateItemDto,
    updatedAt: new Date()
  };

  items[itemIndex] = updatedItem;

  res.json({
    success: true,
    data: updatedItem,
    message: 'Item updated successfully'
  });
};

export const deleteItem = (req: Request, res: Response): void => {
  const { id } = req.params;

  const itemIndex = items.findIndex(item => item.id === id);

  if (itemIndex === -1) {
    res.status(404).json({
      success: false,
      message: `Item with id ${id} not found`
    });
    return;
  }

  const deletedItem = items[itemIndex];
  items = items.filter(item => item.id !== id);

  res.json({
    success: true,
    data: deletedItem,
    message: 'Item deleted successfully'
  });
};
