import { ComponentFixture, TestBed } from '@angular/core/testing';
import { Test1Component } from './test1.component';
import { SavevalueService } from '../savevalue.service';
describe('Test1Component', () => {
  let component: Test1Component;
  let fixture: ComponentFixture<Test1Component>;
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [Test1Component],
      providers: [SavevalueService],
    }).compileComponents();
    fixture = TestBed.createComponent(Test1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });
  it('should return the uppercase string', () => {
    let str: string = 'demo';
    expect(component.check(str)).toBe(str.toUpperCase());
  });
  xit('should return the uppercase string', () => {
    let str: string = 'demo';
    expect(component.check(str)).toBe(str.toUpperCase());
  });
  it('To be demo', () => {
    let a: string = 'demo';
    let b: string = 'demo';
    expect(a).toBe(b);
  });
  it('to equal', () => {
    let a = 1;
    let b = 1;
    expect(a).toEqual(b);
  });
  it('Array', () => {
    let a: Array<number> = [1, 1];
    let b: Array<number> = [1, 1];
    expect(a).toEqual(b);
  });
  it('demo', () => {
    let a = 'Hello';
    expect(a).toBe('Hello');
  });
  it('to be falsy', () => {
    expect(undefined).toBeFalsy();
  });
  it('to be truthy', () => {
    expect(1).toBeTruthy();
  });
  it('GreaterThen', () => {
    let a = 5;
    expect(a).toBeGreaterThan(4);
  });
  it('GreaterThenOrEqual', () => {
    let b = 10;
    expect(b).toBeGreaterThanOrEqual(10);
  });
  it('to metch', () => {
    let value = 'this is demo string 123';
    expect(value).toMatch(/[0-9]$/);
  });
  it('close to', () => {
    expect(2.2345).toBeCloseTo(2.23);
  });
  it('to be define', () => {
    let val;
    let obj = {
      name: 'jay',
    };
    expect(obj).toBeDefined();
    expect(val).not.toBeDefined();
  });
  it('to be undefined', () => {
    let valueUndefined;
    expect(valueUndefined).toBeUndefined();
  });
  it('to be null', () => {
    expect(null).toBeNull();
  });
  it('to contain', () => {
    expect([0, 1, 2]).toContain(1);
  });
  it('to be nan', () => {
    expect(0 / 0).toBeNaN();
  });
  it('to be positive', () => {
    expect(1 / 0).toBePositiveInfinity();
  });
  it('to be negative', () => {
    expect(-1 / 0).toBeNegativeInfinity();
  });
  it('should spyon', () => {
    spyOn(component, 'Increase');
    component.saveValue(12);
    expect(component.Increase).toHaveBeenCalled();
  });
  it('should spyon with returnvalue', () => {
    spyOn(component, 'Increase').and.returnValue(45);
    let res = component.CheckReturn();
    expect(res).toEqual('high');
  });
});
