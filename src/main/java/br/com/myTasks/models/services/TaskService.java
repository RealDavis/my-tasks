package br.com.myTasks.models.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.myTasks.exceptions.NoTasksException;
import br.com.myTasks.interfaces.ISession;
import br.com.myTasks.interfaces.ITaskRepository;
import br.com.myTasks.interfaces.ITaskService;
import br.com.myTasks.models.entityes.Task;
import br.com.myTasks.models.entityes.User;

@RequestScoped
public class TaskService implements ITaskService {
	
	private ISession session;
	private ITaskRepository taskRepository;
	private Task task;
	
	private List<Task> notFinishedTasks;
	private List<Task> finishedTasks;
	
	@Deprecated
	public TaskService() {
		this(null, null, null);
	}
	
	@Inject
	public TaskService(ISession session, ITaskRepository taskRepository, Task task) {
		this.session = session;
		this.taskRepository = taskRepository;
		this.task = task;
	}

	@Override
	public void createTask(Task task) {
		task.setFinished(false);
		task.setUser(session.getUser());
		
		taskRepository.insert(task);
	}

	@Override
	public Map<String, List<Task>> getTaskList(User user) throws NoTasksException {
		List<Task> list = taskRepository.getAll(user);
		if(list.isEmpty()) {
			throw new NoTasksException("Nenhuma tarefa cadastrada");
		}
		
		createLists();
		fillLists(list);
		
		Map<String, List<Task>> map = new HashMap<>();
		fillMap(map);
		return map;
	}
	
	@Override
	public void remove(Long id) {
		task = taskRepository.get(id);
		taskRepository.remove(task);
	}

	@Override
	public void finish(Long id) {
		task = taskRepository.get(id);
		task.setFinished(true);
		taskRepository.finish(task);
	}
	
	@Override
	public Task get(Long id) {
		return taskRepository.get(id);
	}
	
	@Override
	public void editTask(Task task) {
		Task dbTask = taskRepository.get(task.getId());
		dbTask.setName(task.getName());
		dbTask.setDate(task.getDate());
		dbTask.setHour(task.getHour());
		dbTask.setFinished(task.isFinished());
		dbTask.setDetails(task.getDetails());
		taskRepository.edit(dbTask);
	}
	
	//métodos para criar e preencher lists e maps
	private void createLists() {
		notFinishedTasks = new ArrayList<>();
		finishedTasks = new ArrayList<>();
	}
	
	private void fillLists(List<Task> list) {
		for (Task task : list) {
			if(task.isFinished()) {
				finishedTasks.add(task);
			} else {
				notFinishedTasks.add(task);
			}
		}
	}
	
	private void fillMap(Map<String, List<Task>> map) {
		map.put("notFinishedTasks", notFinishedTasks);
		map.put("finishedTasks", finishedTasks);
	}

}